//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.P2PTest.config
{
	import org.swiftsuspenders.Injector;

//	import robotlegs.bender.P2PTest.models.TodoModel;
//	import robotlegs.bender.P2PTest.views.TodoItemRenderer;
//	import robotlegs.bender.P2PTest.views.TodoItemRendererMediator;
//	import robotlegs.bender.P2PTest.views.TodoMediator;
//	import robotlegs.bender.P2PTest.views.TodoPM;
//	import robotlegs.bender.P2PTest.views.TodoView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	public class P2ptestConfig implements IConfig
	{
		[Inject]
		public var injector:Injector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
//			injector.map(TodoModel).asSingleton();
//			injector.map(TodoPM).asSingleton();
//			mediatorMap.map(TodoView).toMediator(TodoMediator);
//			mediatorMap.map(TodoItemRenderer).toMediator(TodoItemRendererMediator);
		}
	}
}
