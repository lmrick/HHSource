package package_83
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1605
   {
       
      
      private var var_854:String;
      
      private var var_648:int;
      
      private var var_596:int;
      
      private var var_349:int;
      
      private var var_247:int;
      
      private var var_340:Boolean;
      
      private var var_271:String;
      
      private var var_860:String;
      
      private var var_1330:int;
      
      private var var_584:String;
      
      private var var_672:int;
      
      private var var_656:int;
      
      private var var_673:int;
      
      private var var_1157:int;
      
      private var _catalogPageName:String;
      
      private var var_1272:String;
      
      private var var_833:Boolean;
      
      private var var_600:Date;
      
      public function class_1605(param1:IMessageDataWrapper)
      {
         var_600 = new Date();
         super();
         var_854 = param1.readString();
         var_648 = param1.readInteger();
         var_596 = param1.readInteger();
         var_349 = param1.readInteger();
         var_247 = param1.readInteger();
         var_340 = param1.readBoolean();
         var_271 = param1.readString();
         var_860 = param1.readString();
         var_1330 = param1.readInteger();
         var_584 = param1.readString();
         var_672 = param1.readInteger();
         var_656 = param1.readInteger();
         var_1157 = param1.readInteger();
         _catalogPageName = param1.readString();
         var_1272 = param1.readString();
         var_833 = param1.readBoolean();
      }
      
      public static function getCampaignLocalizationKeyForCode(param1:String) : String
      {
         return "quests." + param1;
      }
      
      public function get campaignCode() : String
      {
         return var_854;
      }
      
      public function get localizationCode() : String
      {
         return var_584;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return var_648;
      }
      
      public function get questCountInCampaign() : int
      {
         return var_596;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function get accepted() : Boolean
      {
         return var_340;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get imageVersion() : String
      {
         return var_860;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return var_1330;
      }
      
      public function get completedSteps() : int
      {
         return var_672;
      }
      
      public function get totalSteps() : int
      {
         return var_656;
      }
      
      public function get isCompleted() : Boolean
      {
         return var_672 == var_656;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(var_673 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - var_600.getTime();
         return int(Math.max(0,var_673 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return getCampaignLocalizationKeyForCode(campaignCode);
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + var_584;
      }
      
      public function get completedCampaign() : Boolean
      {
         return var_247 < 1;
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         var_340 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return var_648 >= var_596;
      }
      
      public function get receiveTime() : Date
      {
         return var_600;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         var_673 = param1;
      }
      
      public function get sortOrder() : int
      {
         return var_1157;
      }
      
      public function get catalogPageName() : String
      {
         return _catalogPageName;
      }
      
      public function get chainCode() : String
      {
         return var_1272;
      }
      
      public function get easy() : Boolean
      {
         return var_833;
      }
   }
}
