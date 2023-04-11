package package_121
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1537
   {
       
      
      private var var_237:String;
      
      private var var_240:String;
      
      private var var_289:int;
      
      private var var_324:int;
      
      private var var_221:Vector.<int>;
      
      private var var_207:Vector.<int>;
      
      public function class_1537()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var_237 = param1.readString();
         var_240 = param1.readString();
         var_289 = param1.readInteger();
         var_324 = param1.readInteger();
         var_221 = new Vector.<int>(0);
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_221.push(param1.readInteger());
            _loc3_++;
         }
         var_207 = new Vector.<int>(0);
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_207.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function clone() : class_1537
      {
         var _loc1_:class_1537 = new class_1537();
         _loc1_.campaignDays = var_324;
         _loc1_.campaignImage = var_240;
         _loc1_.campaignName = var_237;
         _loc1_.currentDay = var_289;
         _loc1_.missedDays = var_207;
         _loc1_.openedDays = var_221;
         return _loc1_;
      }
      
      public function get campaignName() : String
      {
         return var_237;
      }
      
      public function get campaignImage() : String
      {
         return var_240;
      }
      
      public function get currentDay() : int
      {
         return var_289;
      }
      
      public function get campaignDays() : int
      {
         return var_324;
      }
      
      public function get openedDays() : Vector.<int>
      {
         return var_221;
      }
      
      public function get missedDays() : Vector.<int>
      {
         return var_207;
      }
      
      public function set campaignName(param1:String) : void
      {
         var_237 = param1;
      }
      
      public function set campaignImage(param1:String) : void
      {
         var_240 = param1;
      }
      
      public function set currentDay(param1:int) : void
      {
         var_289 = param1;
      }
      
      public function set campaignDays(param1:int) : void
      {
         var_324 = param1;
      }
      
      public function set openedDays(param1:Vector.<int>) : void
      {
         var_221 = param1;
      }
      
      public function set missedDays(param1:Vector.<int>) : void
      {
         var_207 = param1;
      }
   }
}
