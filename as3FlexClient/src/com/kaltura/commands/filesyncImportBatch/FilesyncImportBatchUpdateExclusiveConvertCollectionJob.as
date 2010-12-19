package com.kaltura.commands.filesyncImportBatch
{
	import com.kaltura.vo.KalturaExclusiveLockKey;
	import com.kaltura.vo.KalturaBatchJob;
	import com.kaltura.delegates.filesyncImportBatch.FilesyncImportBatchUpdateExclusiveConvertCollectionJobDelegate;
	import com.kaltura.net.KalturaCall;

	public class FilesyncImportBatchUpdateExclusiveConvertCollectionJob extends KalturaCall
	{
		public var filterFields : String;
		public function FilesyncImportBatchUpdateExclusiveConvertCollectionJob( id : int,lockKey : KalturaExclusiveLockKey,job : KalturaBatchJob,flavorsData : Array=null )
		{
			if(flavorsData== null)flavorsData= new Array();
			service= 'multicenters_filesyncimportbatch';
			action= 'updateExclusiveConvertCollectionJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = kalturaObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = kalturaObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = extractArray(flavorsData,'flavorsData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FilesyncImportBatchUpdateExclusiveConvertCollectionJobDelegate( this , config );
		}
	}
}
