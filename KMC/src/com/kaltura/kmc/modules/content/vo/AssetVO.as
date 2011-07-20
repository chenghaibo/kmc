package com.kaltura.kmc.modules.content.vo
{
	[Bindable]
	/**
	 * AssetVO class represents VO's of Kaltura assets 
	 * @author Michal
	 * 
	 */	
	public class AssetVO
	{
		/**
		 * download url of the file
		 * */
		public var serveUrl:String;
		
		/**
		 * upload token associated with this asset
		 * */
		public var uploadTokenId:String;
		
	}
}