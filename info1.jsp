<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品列表</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            // 使用 AJAX 從後端取得商品列表
            $.ajax({
                type: "GET",
                url: "script.jsp", // 請根據實際情況修改 URL
                success: function(response) {
                    // 將商品列表動態生成到主頁
                    $("#productContent").html(response);
                },
                error: function(error) {
                    console.log("Error:", error);
                }
            });

            // 監聽商品點擊事件
            $(document).on("click", ".product", function() {
                var productId = $(this).data("id");

                // 使用 AJAX 從後端取得商品詳細信息
                $.ajax({
                    type: "GET",
                    url: "script.jsp", // 請根據實際情況修改 URL
                    data: { productId: productId },
                    success: function(response) {
                        // 將商品詳細信息動態生成到指定區域
                        $("#productDetails").html(response);
                    },
                    error: function(error) {
                        console.log("Error:", error);
                    }
                });
            });
        });
    </script>
</head>
<body>

    <ul class="product-list" id="productContent">
        <!-- 商品列表會在這裡動態生成 -->
    </ul>

    <div id="productDetails">
        <!-- 商品詳細信息會在這裡動態生成 -->
    </div>

</body>
</html>


