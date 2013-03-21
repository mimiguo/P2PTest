package robotlegs.bender.P2PTest.Services
{
	import flash.events.*;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.GroupSpecifier;
	import flash.net.NetConnection;
	import flash.net.NetGroup;
	import flash.net.NetStream;
	
	import robotlegs.bender.P2PTest.Event.NetEventList;
	import robotlegs.bender.P2PTest.models.FMSModel;
	import robotlegs.bender.P2PTest.models.ServerConfig;

	public class FMSServices
	{
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var model:FMSModel;
		
		private var netConnection : NetConnection;
		private var netGroup : NetGroup;
		private var joinGroup:Boolean = false;
		private var sequenceNumber:int = 0;
		private var netStream:NetStream;
		
		public function FMSServices()
		{
			netConnection = new NetConnection();
			netConnection.client = this;
			netConnection.addEventListener(NetStatusEvent.NET_STATUS, connectHandler);
		}
		
		public function startConnect():void
		{
			trace(ServerConfig.TOBE+"/"+ ServerConfig.Application_MULTICAST);
			netConnection.connect(ServerConfig.TOBE+"/"+ServerConfig.Application_MULTICAST);
		}
		
		private function connectHandler(e:NetStatusEvent) : void 
		{
			trace(e.info.code);
			switch (e.info.code)
			{
				case NetEventList.NETCONNECTION_CONNECT_CLOSED:
				case NetEventList.NETCONNECTION_CONNECT_FAILED:
				case NetEventList.NETCONNECTION_CONNECT_REJECTED:
				case NetEventList.NETCONNECTION_CONNECT_APPSHUTDOWN:
				case NetEventList.NETCONNECTION_CONNECT_INVALIDAPP:
					onDisconnect();
					break; 
				case NetEventList.NETCONNECTION_CONNECT_SUCCESS:
//						trace('netConnection.nearID', netConnection.nearID);
//						pushMsg('netConnection.nearID:'+ netConnection.nearID);
					onConnect();
					break;
				case "NetStream.Connect.Success":
					onNetStreamConnect();
					break;
				case "NetStream.Connect.Rejected":
					break;
				case "NetStream.Connect.Failed":
					doDisconnect();
					break;
				case "NetStream.MulticastStream.Reset":
					break;
				case "NetStream.Buffer.Full":
					break;
				
				case "NetGroup.Connect.Success":
					onNetGroupConnect();
					break;
				case "NetGroup.Connect.Rejected":
					break;
				case "NetGroup.Connect.Failed":
					break;
				doDisconnect();
				break;
				case "NetGroup.Posting.Notify":
					var msg:Object = e.info.message;
//					pushMsg( msg.user+" says:"+msg.text );
					break;
				case "NetGroup.SendTo.Notify":
				case "NetGroup.LocalCoverage.Notify":
				case "NetGroup.Neighbor.Connect":
				case "NetGroup.Neighbor.Disconnect":
				case "NetGroup.MulticastStream.PublishNotify":
				case "NetGroup.MulticastStream.UnpublishNotify":
				case "NetGroup.Replication.Fetch.SendNotify":
				case "NetGroup.Replication.Fetch.Failed":
				case "NetGroup.Replication.Fetch.Result":
				case "NetGroup.Replication.Request":
					break;
			}
		}
		
		private function onDisconnect() : void 
		{
//			pushMsg("Disconnected");
			netConnection = null;
			netStream = null;
			netGroup = null;
			joinGroup = false;
			eventDispatcher.dispatchEvent(new Event("Disconnected"));
		}
		
		private function onConnect() : void 
		{
			eventDispatcher.dispatchEvent(new Event(NetEventList.NETCONNECTION_CONNECT_SUCCESS));
			var groupSpecifier:GroupSpecifier = new GroupSpecifier(model.groupSpecifier.groupName);
			groupSpecifier.postingEnabled = true;
			groupSpecifier.multicastEnabled = true;
			groupSpecifier.setPublishPassword(model.groupSpecifier.passWord);
			groupSpecifier.serverChannelEnabled = true;
			
//				netGroup = new NetGroup(netConnection, groupSpecifier.groupspecWithoutAuthorizations());
//				netGroup.addEventListener(NetStatusEvent.NET_STATUS, connectHandler);
			
//			pushMsg( '\ngroupSpecifier.groupspecWithAuthorizations():\n'    + groupSpecifier.groupspecWithAuthorizations() );
//			pushMsg( '\ngroupSpecifier.groupspecWithoutAuthorizations():\n' + groupSpecifier.groupspecWithoutAuthorizations() );
//			pushMsg( '\ngroupSpecifier.toString():\n' + groupSpecifier.toString() );
//			
			netStream = new NetStream(netConnection, groupSpecifier.groupspecWithoutAuthorizations());
			netStream.client = this;
			netStream.addEventListener(NetStatusEvent.NET_STATUS, connectHandler);
		}
		private function onNetStreamConnect() : void
		{
		}
		
		private function doDisconnect() : void 
		{
		}
		
		private function onNetGroupConnect() : void
		{
			//pushMsg(netGroup.info.toString());
			joinGroup = true;
		}
		
		public function onBWDone(...rest):void
		{
			trace('onBWDone();'+ rest, rest.length);
			for (var i:int=0; i<rest.length; ++i) {
				trace("\t"+i+":"+rest[i]);
			}
		}
		public function onMetaData(info:Object):void
		{
			trace('onMetaData');
			for( var p:String in info)
			{
				trace(p, info[p]);
			}
		}
		public function onPlayStatus(info:Object):void
		{
			trace('onPlayStatus');
			for( var p:String in info)
			{
				trace('*', p, info[p]);
			}
		}
	}
}