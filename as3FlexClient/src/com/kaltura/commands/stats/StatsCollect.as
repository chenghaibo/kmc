// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Kaltura Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2016  Kaltura Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
package com.kaltura.commands.stats
{
		import com.kaltura.vo.KalturaStatsEvent;
	import com.kaltura.delegates.stats.StatsCollectDelegate;
	import com.kaltura.net.KalturaCall;

	/**
	* Will write to the event log a single line representing the event
	* client version - will help interprete the line structure. different client versions might have slightly different data/data formats in the line
	* event_id - number is the row number in yuval's excel
	* datetime - same format as MySql's datetime - can change and should reflect the time zone
	* session id - can be some big random number or guid
	* partner id
	* entry id
	* unique viewer
	* widget id
	* ui_conf id
	* uid - the puser id as set by the ppartner
	* current point - in milliseconds
	* duration - milliseconds
	* user ip
	* process duration - in milliseconds
	* control id
	* seek
	* new point
	* referrer
	* 
	* 
	* KalturaStatsEvent $event
	**/
	public class StatsCollect extends KalturaCall
	{
		public var filterFields : String;
		
		/**
		* @param event KalturaStatsEvent
		**/
		public function StatsCollect( event : KalturaStatsEvent )
		{
			service= 'stats';
			action= 'collect';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
				keyValArr = kalturaObject2Arrays(event, 'event');
				keyArr = keyArr.concat(keyValArr[0]);
				valueArr = valueArr.concat(keyValArr[1]);
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new StatsCollectDelegate( this , config );
		}
	}
}
