package com.kaltura.commands.contentDistributionBatch
{
	import com.kaltura.vo.KalturaWorkerQueueFilter;
	import com.kaltura.delegates.contentDistributionBatch.ContentDistributionBatchGetQueueSizeDelegate;
	import com.kaltura.net.KalturaCall;

	public class ContentDistributionBatchGetQueueSize extends KalturaCall
	{
		public var filterFields : String;
		public function ContentDistributionBatchGetQueueSize( workerQueueFilter : KalturaWorkerQueueFilter )
		{
			service= 'contentdistribution_contentdistributionbatch';
			action= 'getQueueSize';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = kalturaObject2Arrays(workerQueueFilter,'workerQueueFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ContentDistributionBatchGetQueueSizeDelegate( this , config );
		}
	}
}
