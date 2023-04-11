package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   public class GetSnowWarGameTokensOfferComposer implements IMessageComposer, class_13
   {
       
      
      private var var_45:Array;
      
      public function GetSnowWarGameTokensOfferComposer()
      {
         var_45 = [];
         super();
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_45 == null;
      }
   }
}
