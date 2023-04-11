package package_17
{
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.class_1610;
   
   [SecureSWF(rename="true")]
   public class class_1652
   {
       
      
      private var var_247:int = 0;
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_30:Number = 0;
      
      private var var_386:int = 0;
      
      private var var_801:int = 0;
      
      private var var_1088:int = 0;
      
      private var var_750:Number = 0;
      
      private var var_271:int = 0;
      
      private var var_609:int = -1;
      
      private var var_159:int = 0;
      
      private var var_45:IStuffData;
      
      private var _expiryTime:int = 0;
      
      private var var_747:int;
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var var_1242:String = null;
      
      private var var_25:Boolean = false;
      
      public function class_1652(param1:int)
      {
         var_45 = new class_1610();
         super();
         var_247 = param1;
      }
      
      public function setReadOnly() : void
      {
         var_25 = true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_25)
         {
            var_29 = param1;
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
      
      public function get dir() : int
      {
         return var_386;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_25)
         {
            var_386 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_801;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_25)
         {
            var_801 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_1088;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_25)
         {
            var_1088 = param1;
         }
      }
      
      public function get sizeZ() : Number
      {
         return var_750;
      }
      
      public function set sizeZ(param1:Number) : void
      {
         if(!var_25)
         {
            var_750 = param1;
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
      
      public function get data() : IStuffData
      {
         return var_45;
      }
      
      public function set data(param1:IStuffData) : void
      {
         if(!var_25)
         {
            var_45 = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return var_1242;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_25)
         {
            var_1242 = param1;
         }
      }
      
      public function get extra() : int
      {
         return var_609;
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_25)
         {
            var_609 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return _expiryTime;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_25)
         {
            _expiryTime = param1;
         }
      }
      
      public function get usagePolicy() : int
      {
         return var_747;
      }
      
      public function set usagePolicy(param1:int) : void
      {
         var_747 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_684 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
   }
}
