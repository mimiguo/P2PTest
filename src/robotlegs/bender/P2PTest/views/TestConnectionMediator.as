package robotlegs.bender.P2PTest.views
{
	import flash.events.MouseEvent;
	
	import mx.core.Application;
	
	import robotlegs.bender.P2PTest.models.FMSApplication;
	import robotlegs.bender.P2PTest.models.Server;
	import robotlegs.bender.P2PTest.views.*;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class TestConnectionMediator extends Mediator
	{
		[Inject]
		public var view:TestConnection;
//		[Inject]
//		public var server:Server;
		public function TestConnectionMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			view.addEventListener(MouseEvent.CLICK, connect);
		}
		
		private function connect(e:MouseEvent) : void 
		{
			trace("connect");
			if (view.connect_btn.label == "disconnect") {
//				view.netConnection.close();
				return;
			}
//			var p2p:String = TOBE+"/"+"multicast";
//			pushMsg('connect '+p2p);
//			netConnection.connect(Server.TOBE);
			trace(Server.TOBE+"/"+FMSApplication.Application_MULTICAST);
		}
	}
}