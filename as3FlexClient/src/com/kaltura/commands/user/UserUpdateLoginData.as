package com.kaltura.commands.user
{
	import com.kaltura.delegates.user.UserUpdateLoginDataDelegate;
	import com.kaltura.net.KalturaCall;

	public class UserUpdateLoginData extends KalturaCall
	{
		public var filterFields : String;
		public function UserUpdateLoginData( oldLoginId : String,password : String,newLoginId : String='',newPassword : String='' )
		{
			service= 'user';
			action= 'updateLoginData';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'oldLoginId' );
			valueArr.push( oldLoginId );
			keyArr.push( 'password' );
			valueArr.push( password );
			keyArr.push( 'newLoginId' );
			valueArr.push( newLoginId );
			keyArr.push( 'newPassword' );
			valueArr.push( newPassword );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UserUpdateLoginDataDelegate( this , config );
		}
	}
}
