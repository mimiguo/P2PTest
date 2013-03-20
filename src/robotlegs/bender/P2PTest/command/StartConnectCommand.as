package robotlegs.bender.P2PTest.command
{
	import robotlegs.bender.P2PTest.Services.FMSServices;
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class StartConnectCommand extends Command
	{
		[Inject]
		public var service:FMSServices;
		
		public function StartConnectCommand()
		{
			super();
		}
		
		public override function execute():void
		{
			this.service.startConnect();
		}
	}
}