/**
 * Created by evgenyyurko on 1/8/14.
 */
package mahjong.models.data
{

import core.DisposableObject;

import serialization.ISerializable;

public class ChipInfo extends DisposableObject implements ISerializable
{
    /*
     * Static
     */

    public static const CHIP_EMPTY:ChipInfo = new ChipInfo();

    public static function getChipEmpty(gridOwner:Array):ChipInfo
    {
        var result:ChipInfo = new ChipInfo();

        result._chipType = EChipType.ETB_EMPTY;
        result._gridOwner = gridOwner;

        return result;
    }

    public static function getCloneWithType(target:ChipInfo, typeValue:int):ChipInfo
    {
        var result:ChipInfo = new ChipInfo();

        result._x = target.x;
        result._y = target.y;
        result._z = target.z;

        result._chipType = typeValue;

        return result;
    }


    /*
     * Fields
     */
    private var _chipType:int;

    private var _x:int;
    private var _y:int;
    private var _z:int;

    private var _gridOwner:Array;


    /*
     * Properties
     */
    public function set grid(value:Array):void
    {
        //TODO: review
    }

    public function get isEnabled():Boolean
    {
        var result:Boolean = false;

        var neighborTop:ChipInfo = null;

        var neighborTopYLeft:ChipInfo = null;
        var neighborTopYRight:ChipInfo = null;

        var neighborTopXLeft:ChipInfo = null;
        var neighborTopXRight:ChipInfo = null;

        var neighborYLeft:ChipInfo = null;
        var neighborYRight:ChipInfo = null;

        var neighborXLeft:ChipInfo = null;
        var neighborXRight:ChipInfo = null;

        Debug.assert(_gridOwner[0][0].length > 3);
        Debug.assert(_gridOwner[0].length > 3);

        if (_z < _gridOwner.length - 1)
        {
            neighborTop = _gridOwner[_z + 1][_y][_x];

            neighborTopYLeft = _y > 2 ? _gridOwner[_z + 1][_y - 1][_x] : null;

            neighborTopYRight = _y < _gridOwner[0].length - 2 ? _gridOwner[_z + 1][_y + 1][_x] : null;

            neighborTopXLeft = _x > 2 ? _gridOwner[_z + 1][_y][_x - 1] : null;

            neighborTopXRight = _x < _gridOwner[0][0].length - 2 ? _gridOwner[_z + 1][_y][_x + 1] : null;
        }

        neighborYLeft = _y >= 2 ? _gridOwner[_z][_y - 2][_x] : null;

        neighborYRight = _y < _gridOwner[0].length - 2 ? _gridOwner[_z][_y + 2][_x] : null;

        neighborXLeft = _x >= 2 ? _gridOwner[_z][_y][_x - 2] : null;

        neighborXRight = _x < _gridOwner[0][0].length - 2 ? _gridOwner[_z][_y][_x + 2] : null;

        var isNeighborTopEmpty:Boolean = (neighborTop == null || neighborTop.chipType == EChipType.ETB_EMPTY);
        var isNeighborTopYLeftEmpty:Boolean = (neighborTopYLeft == null || neighborTopYLeft.chipType == EChipType.ETB_EMPTY);
        var isNeighborTopYRight:Boolean = (neighborTopYRight == null || neighborTopYRight.chipType == EChipType.ETB_EMPTY);
        var isNeighborTopXLeft:Boolean = (neighborTopXLeft == null || neighborTopXLeft.chipType == EChipType.ETB_EMPTY);
        var isNeighborTopXRight:Boolean = (neighborTopXRight == null || neighborTopXRight.chipType == EChipType.ETB_EMPTY);


        if (isNeighborTopEmpty && isNeighborTopYLeftEmpty && isNeighborTopYRight && isNeighborTopXLeft && isNeighborTopXRight)
        {
            var isNeighborXLeft:Boolean = neighborXLeft == null || neighborXLeft.chipType == EChipType.ETB_EMPTY;
            var isNeighborXRight:Boolean = neighborXRight == null || neighborXRight.chipType == EChipType.ETB_EMPTY;
            var isNeighborYLeft:Boolean = neighborYLeft == null || neighborYLeft.chipType == EChipType.ETB_EMPTY;
            var isNeighborYRight:Boolean = neighborYRight == null || neighborYRight.chipType == EChipType.ETB_EMPTY;

            result = ((isNeighborXLeft || isNeighborXRight) && (isNeighborYRight || isNeighborYLeft));
        }

        return result;
    }

    public function get chipType():int
    {
        return _chipType;
    }

    public function get x():int
    {
        return _x;
    }

    public function set x(value:int):void
    {
        _x = value;
    }

    public function get y():int
    {
        return _y;
    }

    public function set y(value:int):void
    {
        _y = value;
    }

    public function get z():int
    {
        return _z;
    }

    public function set z(value:int):void
    {
        _z = value;
    }

    public function set gridOwner(value:Array):void
    {
        _gridOwner = value;
    }

    /*
     * Methods
     */

    public function ChipInfo()
    {
        super(false);

        init();
    }

    private function init():void
    {

    }


    public function serialize():Object
    {
        Debug.assert(false, "no implement");
        return null;
    }


    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("chip_type"));

        Debug.assert(data.hasOwnProperty("x"));
        Debug.assert(data.hasOwnProperty("y"));
        Debug.assert(data.hasOwnProperty("z"));

        _chipType = data["chip_type"];

        _x = data["x"];
        _y = data["y"];
        _z = data["z"];

//        var bool:Boolean = isEnabled;
    }
}
}
