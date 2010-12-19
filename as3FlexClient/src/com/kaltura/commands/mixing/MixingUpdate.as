package com.kaltura.commands.mixing
{
	import com.kaltura.vo.KalturaMixEntry;
	import com.kaltura.delegates.mixing.MixingUpdateDelegate;
	import com.kaltura.net.KalturaCall;

	public class MixingUpdate extends KalturaCall
	{
		public var filterFields : String;
		public function MixingUpdate( entryId : String,mixEntry : KalturaMixEntry )
		{
			service= 'mixing';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = kalturaObject2Arrays(mixEntry,'mixEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingUpdateDelegate( this , config );
		}
	}
}
