package robotlegs.bender.P2PTest.command
{
	import robotlegs.bender.P2PTest.Services.FMSServices;
	import robotlegs.bender.P2PTest.models.FMSModel;
	import robotlegs.bender.P2PTest.models.ServerConfig;
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class PlayCommand extends Command
	{
		[Inject]
		public var service:FMSServices;
		[Inject]
		public var model:FMSModel;
		public override function execute():void
		{
			trace("play execute");
			trace('service.netStream', service.netStream);	
			service.netStream.play(model.streamKey);
		}
	}
}