<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增班级</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="name">班级名称</label>
                    <input id="name" type="text" class="form-control" placeholder="班级名称">
                </div>
                <div class="form-group">
                    <label for="remark">备注</label>
                    <input id="remark" type="text" class="form-control" placeholder="备注">
                </div>
                <div class="form-group">
                    <label for="address">地点</label>
                    <input id="address" type="text" class="form-control" placeholder="地点">
                </div>
                <div class="form-group">
                    <label for="type">班级类型</label>
                    <select name="type" class="form-control">
                        <options>--请选择--</options>
                    </select>
                </div>
                <div class="form-group">
                    <label for="photo">图片</label>
                    <input id="photo" type="file" class="form-control"></input>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</template> 