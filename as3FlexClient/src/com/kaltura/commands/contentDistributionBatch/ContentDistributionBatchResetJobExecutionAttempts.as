package com.kaltura.commands.contentDistributionBatch
{
	import com.kaltura.vo.KalturaExclusiveLockKey;
	import com.kaltura.delegates.contentDistributionBatch.ContentDistributionBatchResetJobExecutionAttemptsDelegate;
	import com.kaltura.net.KalturaCall;

	public class ContentDistributionBatchResetJobExecutionAttempts extends KalturaCall
	{
		public var filterFields : String;
		public function ContentDistributionBatchResetJobExecutionAttempts( id : int,lockKey : KalturaExclusiveLockKey,jobType : String )
		{
			service= 'contentdistribution_contentdistributionbatch';
			action= 'resetJobExecutionAttempts';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = kalturaObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'jobType' );
			valueArr.push( jobType );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ContentDistributionBatchResetJobExecutionAttemptsDelegate( this , config );
		}
	}
}
