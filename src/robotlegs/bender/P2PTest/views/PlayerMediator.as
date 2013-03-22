package robotlegs.bender.P2PTest.views
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Video;
	
	import mx.core.UIComponent;
	
	import robotlegs.bender.P2PTest.Services.FMSServices;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class PlayerMediator extends Mediator
	{
		[Inject]
		public var view:Player;
		[Inject]
		public var service:FMSServices;
		private var vid:Video;
		private var vidContainer:UIComponent;
		
		public function PlayerMediator()
		{
			super();
		}
		public override function initialize():void
		{
			addViewListener(MouseEvent.CLICK, play);
			vid = new Video(320,240);
			vidContainer = new UIComponent();
			vidContainer.addChild(vid);
			view.videoPlaceholder.addElement(vidContainer);
		}
		private function play(e:MouseEvent):void
		{
			if (e.target == view.play_btn) {
				dispatch(new Event("play"));
				vid.attachNetStream(service.netStream);
			}
		}
	}
}