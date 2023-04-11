package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1578
   {
       
      
      private var var_271:int;
      
      private var var_759:int;
      
      private var var_785:int;
      
      private var var_887:Boolean;
      
      private var var_1148:Boolean;
      
      public function class_1578(param1:IMessageDataWrapper)
      {
         super();
         var_271 = param1.readInteger();
         var_759 = param1.readInteger();
         var_785 = param1.readInteger();
         var_887 = param1.readBoolean();
         var_1148 = param1.readBoolean();
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get breedId() : int
      {
         return var_759;
      }
      
      public function get paletteId() : int
      {
         return var_785;
      }
      
      public function get sellable() : Boolean
      {
         return var_887;
      }
      
      public function get rare() : Boolean
      {
         return var_1148;
      }
   }
}
