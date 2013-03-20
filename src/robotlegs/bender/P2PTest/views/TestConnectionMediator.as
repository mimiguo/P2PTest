package robotlegs.bender.P2PTest.views
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.Application;
	
	import robotlegs.bender.P2PTest.Event.EventsList;
	import robotlegs.bender.P2PTest.models.Server;
	import robotlegs.bender.P2PTest.views.*;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class TestConnectionMediator extends Mediator
	{
		[Inject]
		public var view:TestConnection;
		
		public override function initialize():void
		{
//			view.addEventListener(MouseEvent.CLICK, connect);
			addViewListener(MouseEvent.CLICK, connect);
		}
		
		private function connect(e:MouseEvent) : void 
		{
			if (view.connect_btn.label == "disconnect") {
				return;
			}
			dispatch(new Event(EventsList.STARTCONNECT));
		}
	}
}