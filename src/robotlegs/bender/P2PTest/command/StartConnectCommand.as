package robotlegs.bender.P2PTest.command
{
	import flash.events.TextEvent;
	
	import mx.utils.ObjectUtil;
	
	import robotlegs.bender.P2PTest.Services.FMSServices;
	import robotlegs.bender.P2PTest.models.FMSModel;
	import robotlegs.bender.P2PTest.models.vo.GroupSpecifierVO;
	import robotlegs.bender.P2PTest.views.TestConnection;
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class StartConnectCommand extends Command
	{
		[Inject]
		public var model:FMSModel;
		
		[Inject]
		public var service:FMSServices;
		
		[Inject]
		public var event:TextEvent;
		
		public function StartConnectCommand()
		{
			super();
		}
		
		public override function execute():void
		{
//			var vo:GroupSpecifierVO = JSON.parse(event.text) as GroupSpecifierVO;
			var vo:Object = JSON.parse(event.text);
			model.groupSpecifier = vo;
			this.service.startConnect();
		}
	}
}