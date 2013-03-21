package robotlegs.bender.P2PTest.config
{
	import flash.events.Event;
	import flash.events.TextEvent;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.P2PTest.Event.EventsList;
	import robotlegs.bender.P2PTest.Services.FMSServices;
	import robotlegs.bender.P2PTest.command.StartConnectCommand;
	import robotlegs.bender.P2PTest.models.FMSModel;
	import robotlegs.bender.P2PTest.views.*;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	public class P2ptestConfig implements IConfig
	{
		[Inject]
		public var injector:Injector;

		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;

		public function configure():void
		{
			injector.map(FMSModel).asSingleton();
			injector.map(FMSServices).asSingleton();
			mediatorMap.map(TestConnection).toMediator(TestConnectionMediator);
//			commandMap.map(EventsList.STARTCONNECT, Event).toCommand(StartConnectCommand);
			commandMap.map(EventsList.STARTCONNECT, flash.events.TextEvent).toCommand(StartConnectCommand);
		}
	}
}