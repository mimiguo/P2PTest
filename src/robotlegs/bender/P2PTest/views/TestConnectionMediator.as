package robotlegs.bender.P2PTest.views
{
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	
	import robotlegs.bender.P2PTest.Event.EventsList;
	import robotlegs.bender.P2PTest.Event.NetEventList;
	import robotlegs.bender.P2PTest.models.ServerConfig;
	import robotlegs.bender.P2PTest.models.vo.GroupSpecifierVO;
	import robotlegs.bender.P2PTest.views.*;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class TestConnectionMediator extends Mediator
	{
		[Inject]
		public var view:TestConnection;
		
		public override function initialize():void
		{
			addViewListener(MouseEvent.CLICK, connect);
			addContextListener(NetEventList.NETCONNECTION_CONNECT_SUCCESS, onConnect);
			addContextListener("Disconnected", function():void{view.connect_btn.label = "connect";});
//			eventDispatcher.addEventListener(NetEventList.NETCONNECTION_CONNECT_SUCCESS, onConnect);
		}
		
		private function connect(e:MouseEvent) : void 
		{
			if (view.connect_btn.label == "disconnect") {
				return;
			}
			var vo:GroupSpecifierVO = new GroupSpecifierVO();
			vo.groupName = view.groupName_ti.text;
			vo.passWord  = view.pwd_ti.text;
			var data:String = JSON.stringify(vo);
			dispatch(new TextEvent(EventsList.STARTCONNECT, false, false, data));
		}
		private function onConnect(e:Event):void
		{
			view.connect_btn.label = "disconnect";
		}
	}
}