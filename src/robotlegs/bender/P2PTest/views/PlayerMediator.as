package robotlegs.bender.P2PTest.views
{
	import flash.events.MouseEvent;
	import flash.media.Video;
	
	import mx.core.UIComponent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class PlayerMediator extends Mediator
	{
		[Inject]
		public var view:Player;
		
		private var vid:Video;
		private var vidContainer:UIComponent;
		
		public function PlayerMediator()
		{
			super();
		}
		public override function initialize():void
		{
//			vid = new Video(320,240);
//			vidContainer = new UIComponent();
//			vidContainer.addChild(vid);
//			view.videoPlaceholder.addElement(vidContainer);
			
			addViewListener(MouseEvent.CLICK, play);
		}
		private function play(e:MouseEvent):void
		{
			trace('play');
//			netStream.play('livestream');
//			vid.attachNetStream(netStream);
		}
	}
}