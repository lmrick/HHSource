package package_93
{
   [SecureSWF(rename="true")]
   public class class_1544
   {
       
      
      protected var var_519:int;
      
      protected var var_846:int;
      
      protected var _songName:String;
      
      protected var var_988:String;
      
      private var var_1222:Number = 0;
      
      public function class_1544(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_519 = param1;
         var_846 = param2;
         _songName = param3;
         var_988 = param4;
      }
      
      public function get id() : int
      {
         return var_519;
      }
      
      public function get length() : int
      {
         return var_846;
      }
      
      public function get name() : String
      {
         return _songName;
      }
      
      public function get creator() : String
      {
         return var_988;
      }
      
      public function get startPlayHeadPos() : Number
      {
         return var_1222;
      }
      
      public function set startPlayHeadPos(param1:Number) : void
      {
         var_1222 = param1;
      }
   }
}
