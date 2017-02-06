<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增教师</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input id="name" type="text" class="form-control" placeholder="姓名">
                </div>
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input id="email" type="text" class="form-control" placeholder="邮箱">
                </div>
                <div class="form-group">
                    <label for="phone">电话</label>
                    <input id="phone" type="text" class="form-control" placeholder="电话">
                </div>
                <div class="form-group">
                    <label for="direction">研究方向</label>
                    <textarea id="direction" type="text" class="form-control" placeholder="研究方向"></textarea>
                </div>
                <div class="form-group">
                    <label for="detail">详细介绍</label>
                    <textarea id="detail" type="text" class="form-control" placeholder="详细介绍"></textarea>
                </div>
                <div class="form-group">
                    <label for="photo">照片</label>
                    <input id="photo" type="file" class="form-control"></input>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</template>