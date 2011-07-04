package com.kaltura.vo
{
	import com.kaltura.vo.BaseFlexVo;
	[Bindable]
	public dynamic class KalturaCuePoint extends BaseFlexVo
	{
		/** 
		* 		* */ 
		public var id : String;

		/** 
		* 		* */ 
		public var type : String;

		/** 
		* 		* */ 
		public var status : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var entryId : String;

		/** 
		* 		* */ 
		public var partnerId : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var createdAt : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var updatedAt : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var tags : String;

		/** 
		* 		* */ 
		public var startTime : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var userId : String;

		/** 
		* 		* */ 
		public var partnerData : String;

		/** 
		* 		* */ 
		public var partnerSortValue : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var forceStop : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var thumbOffset : int = int.MIN_VALUE;

		/** 
		* a list of attributes which may be updated on this object 
		* */ 
		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('type');
			arr.push('status');
			arr.push('entryId');
			arr.push('tags');
			arr.push('startTime');
			arr.push('partnerData');
			arr.push('partnerSortValue');
			arr.push('forceStop');
			arr.push('thumbOffset');
			return arr;
		}

		/** 
		* a list of attributes which may only be inserted when initializing this object 
		* */ 
		public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			return arr;
		}

	}
}