<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增文章</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="title">标题</label>
                    <input id="title" type="text" class="form-control" placeholder="标题">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input id="author" type="text" class="form-control" placeholder="作者">
                </div>
                <div class="form-group">
                    <label for="author">来源</label>
                    <input id="author" type="text" class="form-control" placeholder="来源">
                </div>
                <div class="form-group">
                    <label for="content">内容</label>
                    <textarea id="content" type="text" class="form-control" placeholder="内容"></textarea>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</template> 