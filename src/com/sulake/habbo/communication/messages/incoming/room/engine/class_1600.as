package package_17
{
   [SecureSWF(rename="true")]
   public class class_1600
   {
       
      
      private var var_247:int = 0;
      
      private var var_933:Boolean = false;
      
      private var var_738:int = 0;
      
      private var var_1119:int = 0;
      
      private var var_710:int = 0;
      
      private var var_884:int = 0;
      
      private var var_28:Number = 0;
      
      private var var_30:Number = 0;
      
      private var var_386:String = "";
      
      private var var_271:int = 0;
      
      private var var_159:int = 0;
      
      private var var_45:String = "";
      
      private var var_25:Boolean = false;
      
      private var var_747:int = 0;
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var _secondsToExpiration:int;
      
      public function class_1600(param1:int, param2:int, param3:Boolean)
      {
         super();
         var_247 = param1;
         var_271 = param2;
         var_933 = param3;
      }
      
      public function setReadOnly() : void
      {
         var_25 = true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_933;
      }
      
      public function get wallX() : Number
      {
         return var_738;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_25)
         {
            var_738 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return var_1119;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_25)
         {
            var_1119 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return var_710;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_25)
         {
            var_710 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return var_884;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_25)
         {
            var_884 = param1;
         }
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_25)
         {
            var_28 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_25)
         {
            var_30 = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_386;
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_25)
         {
            var_386 = param1;
         }
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_25)
         {
            var_271 = param1;
         }
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_25)
         {
            var_159 = param1;
         }
      }
      
      public function get data() : String
      {
         return var_45;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_25)
         {
            var_45 = param1;
         }
      }
      
      public function get usagePolicy() : int
      {
         return var_747;
      }
      
      public function set usagePolicy(param1:int) : void
      {
         if(!var_25)
         {
            var_747 = param1;
         }
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function set ownerId(param1:int) : void
      {
         if(!var_25)
         {
            var_684 = param1;
         }
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set ownerName(param1:String) : void
      {
         if(!var_25)
         {
            _ownerName = param1;
         }
      }
      
      public function get secondsToExpiration() : int
      {
         return _secondsToExpiration;
      }
      
      public function set secondsToExpiration(param1:int) : void
      {
         if(!var_25)
         {
            _secondsToExpiration = param1;
         }
      }
   }
}
