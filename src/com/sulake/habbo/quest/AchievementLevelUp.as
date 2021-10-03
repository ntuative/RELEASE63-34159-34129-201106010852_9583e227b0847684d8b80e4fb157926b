package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class AchievementLevelUp implements IDisposable
   {
      
      private static const const_1121:int = 2000;
      
      private static const const_1647:int = 500;
      
      private static const const_1646:int = 500;
      
      private static const const_2024:int = 300;
      
      private static const const_1644:int = 1400;
      
      private static const const_1641:Number = 1;
      
      private static const const_1645:int = 3;
      
      private static const const_1120:int = 0;
      
      private static const const_1122:int = 1;
      
      private static const const_687:int = 2;
      
      private static const const_1123:int = 3;
      
      private static const const_1640:int = 800;
      
      private static const const_1642:int = 15;
      
      private static const const_1643:int = 300;
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_65:AchievementLevelUpData;
      
      private var var_874:Array;
      
      private var var_873:int;
      
      private var var_2115:int = 0;
      
      private var var_2114:int;
      
      private var var_572:int;
      
      private var var_1630:int;
      
      private var var_1631:int = 3;
      
      private var var_872:BitmapData;
      
      private var var_2938:Point;
      
      private var var_573:Array;
      
      private var var_2116:ColorMatrixFilter;
      
      private var _twinkleImages:TwinkleImages;
      
      private var var_700:Animation;
      
      public function AchievementLevelUp(param1:HabboQuestEngine)
      {
         this.var_874 = new Array();
         this.var_573 = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         this.var_2116 = new ColorMatrixFilter(this.var_573);
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_874 = null;
         this.var_65 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this._twinkleImages)
         {
            this._twinkleImages.dispose();
            this._twinkleImages = null;
         }
         if(this.var_700)
         {
            this.var_700.dispose();
            this.var_700 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onLevelUp(param1:AchievementLevelUpData) : void
      {
         this.var_874.push(param1);
         this._questEngine.sessionDataManager.getBadgeImage(param1.badgeCode);
         this._questEngine.sessionDataManager.getBadgeImage(this._questEngine.localization.getPreviousLevelBadgeId(param1.badgeCode));
         if(this._window == null || !this._window.visible)
         {
            this.var_873 = const_1121;
         }
         if(this._twinkleImages == null)
         {
            this._twinkleImages = new TwinkleImages(this._questEngine);
         }
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
            if(this.var_874.length > 0)
            {
               this.var_873 = const_1647;
            }
         }
      }
      
      private function show() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("AchievementLevelUp"));
            this._window.findChildByTag("close").procedure = this.onCloseLink;
            this._window.findChildByName("ok_button").procedure = this.onOkButton;
            this._window.findChildByName("share_button").procedure = this.onShareButton;
            new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"ach_receive_star");
            this._window.findChildByName("achievements_link_region").procedure = this.onAchievementsLink;
            this._window.findChildByName("close_link_region").procedure = this.onCloseLink;
            _loc2_ = const_1640;
            this.var_700 = new Animation(IBitmapWrapperWindow(this._window.findChildByName("twinkle_bitmap")));
            _loc3_ = 0;
            while(_loc3_ < const_1642)
            {
               this.var_700.addObject(new Twinkle(this._twinkleImages,_loc2_));
               _loc2_ += const_1643;
               _loc3_++;
            }
         }
         this.registerParameter("achievements.levelup.title","category",this._questEngine.getAchievementCategoryName(this.var_65.category));
         this.registerParameter("achievements.levelup.reward","amount","" + this.var_65.levelRewardPoints);
         this.registerParameter("achievements.levelup.reward","currency_name",this._questEngine.getActivityPointName(this.var_65.levelRewardPointType));
         this.registerParameter("achievements.levelup.score","amount","" + this.var_65.points);
         this.registerParameter("achievements.levelup.sharedesc","amount","" + this.var_65.bonusPoints);
         this._window.findChildByName("achievement_name_txt").caption = "\'" + this._questEngine.localization.getBadgeName(this.var_65.badgeCode) + "\'";
         var _loc1_:Boolean = this.isFacebookPostingEnabled();
         this._window.findChildByName("achievements_link_region").visible = !_loc1_;
         this._window.findChildByName("close_link_region").visible = _loc1_;
         this._window.findChildByName("ok_button").visible = !_loc1_;
         this._window.findChildByName("share_button").visible = _loc1_;
         this._window.findChildByName("facebook_info_txt").visible = _loc1_;
         this.doFacebookLogging();
         if(this.var_65.level > 1)
         {
            this.setFadeStatus(const_1122);
         }
         else
         {
            this.setFadeStatus(const_687,const_1644);
         }
         this.var_700.restart();
      }
      
      private function setFadeStatus(param1:int, param2:int = 300) : void
      {
         this.var_872 = null;
         this.var_2115 = param1;
         this.var_572 = param2;
         this.var_2114 = param2;
         this.var_1630 = const_1646;
      }
      
      private function isFacebookPostingEnabled() : Boolean
      {
         return this.var_65.bonusPoints > 0 && this.isPostingEnabled() && this._questEngine.configuration.keyExists("facebook.user");
      }
      
      private function isPostingEnabled() : Boolean
      {
         return this._questEngine.configuration.getKey("achievement.post.enabled","1") != "0";
      }
      
      private function doFacebookLogging() : void
      {
         var _loc1_:Boolean = this._questEngine.configuration.keyExists("facebook.user");
         var _loc2_:String = this.var_65.badgeCode;
         if(this.var_65.bonusPoints <= 0 || !this.isPostingEnabled())
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.no_post"));
         }
         else if(_loc1_)
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.post"));
         }
         else
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.no_fb"));
         }
      }
      
      private function onOkButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onCloseLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onAchievementsLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.achievementController.show();
            this.close();
         }
      }
      
      private function onShareButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.send(new GetAchievementShareIdComposer(this.var_65.achievementID));
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",this.var_65.badgeCode,"client.start_post"));
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_873 > 0)
         {
            this.checkDialogOpen(param1);
            return;
         }
         if(this.var_700 != null)
         {
            this.var_700.update(param1);
         }
         if(this._window == null || this.var_2115 == const_1120)
         {
            return;
         }
         switch(this.var_2115)
         {
            case const_1122:
               this.var_1630 -= param1;
               this.animateBadgeImage(true);
               if(this.var_1630 < 0)
               {
                  this.setFadeStatus(const_1123);
               }
               break;
            case const_1123:
               this.var_572 -= param1;
               this.animateBadgeImage(true);
               if(this.var_572 < 0)
               {
                  this.setFadeStatus(const_687);
               }
               break;
            case const_687:
               this.var_572 -= param1;
               this.animateBadgeImage(false);
               if(this.var_572 < 0)
               {
                  this.setFadeStatus(const_1120);
               }
         }
      }
      
      private function checkDialogOpen(param1:uint) : void
      {
         this.var_873 -= param1;
         if(this.var_873 > 0)
         {
            return;
         }
         if(this.var_874.length < 1)
         {
            return;
         }
         var _loc2_:AchievementLevelUpData = this.var_874.pop();
         if(this._questEngine.sessionDataManager.getBadgeImageWithInfo(_loc2_.badgeCode).placeHolder || this._questEngine.sessionDataManager.getBadgeImageWithInfo(this._questEngine.localization.getPreviousLevelBadgeId(_loc2_.badgeCode)).placeHolder)
         {
            if(this.var_1631 > 0)
            {
               this.var_874.push(_loc2_);
               this.var_873 = const_1121;
               --this.var_1631;
               return;
            }
            this.var_1631 = const_1645;
         }
         this.var_65 = _loc2_;
         this.show();
         this._window.center();
         this._window.visible = true;
         this._window.activate();
      }
      
      public function requestFacebookPostDialog(param1:String, param2:String) : void
      {
         if(this._window == null || this.var_65 == null || this.var_65.badgeCode != param1)
         {
            Logger.log("Invalid facebook post: " + param1 + ", " + (this.var_65 == null ? "current is null" : this.var_65.badgeCode));
            return;
         }
         var _loc3_:String = this.getFacebookText("notifications.text.achievement_facebook");
         var _loc4_:String = this.getFacebookText("notifications.text.achievement_facebook_title");
         HabboWebTools.facebookAchievementPost(this.var_65.badgeCode,_loc4_,_loc3_,param2);
         this.close();
      }
      
      private function getFacebookText(param1:String) : String
      {
         var _loc2_:String = this._questEngine.sessionDataManager.userName;
         var _loc3_:String = this._questEngine.sessionDataManager.realName;
         var _loc4_:String = this._questEngine.localization.getAchievementNameForFacebook(this.var_65.badgeCode,_loc2_,_loc3_,this.var_65.level);
         var _loc5_:String = this._questEngine.localization.getAchievementDescForFacebook(this.var_65.badgeCode,_loc2_,_loc3_,this.var_65.level);
         this.registerParameter(param1,"badge_name",this._questEngine.localization.getBadgeName(this.var_65.badgeCode));
         this.registerParameter(param1,"badge_desc",this._questEngine.localization.getBadgeDesc(this.var_65.badgeCode));
         this.registerParameter(param1,"badge_name_fb",_loc4_);
         this.registerParameter(param1,"badge_desc_fb",_loc5_);
         this.registerParameter(param1,"level",this.var_65.level.toString());
         this.registerParameter(param1,"name",_loc2_);
         this.registerParameter(param1,"realname",_loc3_);
         return this._questEngine.localization.getKey(param1,param1);
      }
      
      private function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this._questEngine.localization.registerParameter(param1,param2,param3);
      }
      
      private function animateBadgeImage(param1:Boolean) : void
      {
         this.changeBadgeColorFilter(param1);
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("achievement_pic_bitmap"));
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
         if(this.var_872 == null)
         {
            this.var_872 = !!param1 ? this._questEngine.sessionDataManager.getBadgeImage(this._questEngine.localization.getPreviousLevelBadgeId(this.var_65.badgeCode)) : this._questEngine.sessionDataManager.getBadgeImage(this.var_65.badgeCode);
            this.var_2938 = new Point((_loc2_.width - this.var_872.width) / 2,(_loc2_.height - this.var_872.height) / 2);
         }
         _loc2_.bitmap.fillRect(_loc2_.bitmap.rect,0);
         _loc2_.bitmap.applyFilter(this.var_872,this.var_872.rect,this.var_2938,this.var_2116);
         _loc2_.invalidate(_loc2_.rectangle);
      }
      
      private function changeBadgeColorFilter(param1:Boolean) : void
      {
         var _loc2_:int = Math.max(0,!param1 ? Number(this.var_572) : Number(this.var_2114 - this.var_572));
         var _loc3_:Number = _loc2_ / this.var_2114 * const_1641;
         this.var_573[3] = _loc3_;
         this.var_573[8] = _loc3_;
         this.var_573[13] = _loc3_;
         this.var_573[0] = 1 - _loc3_;
         this.var_573[6] = 1 - _loc3_;
         this.var_573[12] = 1 - _loc3_;
         this.var_2116.matrix = this.var_573;
      }
   }
}
