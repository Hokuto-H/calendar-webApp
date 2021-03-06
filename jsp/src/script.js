$(function () {
  //*カレンダー選択ボタン
  $(".cell").click(function () {
    $(this).children(".change").removeClass("inactive");
  });
  $(".change-type").click(function () {
    let change = $(this).val();
    if (change == "休講" || change == "振替" || change == "宿題" || change == "試験") {
      //*change-calendarクラス
      $(this).siblings('.change-calendar').removeClass("inactive");
      //*change-periodクラス
      $(this).siblings('.change-period').removeClass("inactive");
    }
    if (change == "") {
      //*change-calendarクラス
      $(this).siblings(".change-calendar").addClass("inactive");
      //*change-periodクラス
      $(this).siblings(".change-period").addClass("inactive");
    }
  });
  //*ここまで

  //*追加・削除ボタン
  $(".addition").click(function () {
    const add = $(this).parents(".form-lesson-container");
    const $formParts = $(this).parent(".lesson-title-button").next().clone();
    //*曜日・時限・教科名のタイトルを削除
    $formParts.children(".lesson-subtitle").remove();
    $formParts.find(".form-input").val("");
    add.append($formParts);
  });
  $(".deletion").click(function () {
    const del = $(this)
      .parents(".form-lesson-container")
      .children(".lesson:last");
    const count = $(this).parents(".form-lesson-container").children(".lesson")
      .length;
    //*1つは残すためのif文
    if (count > 1) {
      del.remove();
    }
  });
  //*ここまで

  //*パスワード見え隠れボタン
  $(".fas").click(function () {
    //* iconの切り替え
    $(this).toggleClass("fa-eye fa-eye-slash");
    //* 入力フォームの取得
    const input = $(this).parent().prev("input");
    //* type切替
    if (input.attr("type") == "password") {
      input.attr("type", "text");
    } else {
      input.attr("type", "password");
    }
  });
  //*ここまで

  //*パスワードチェック
  $("#password-re").change(function () {
    const password = $("#password").val();
    const passwordRe = $("#password-re").val();
    if (password === passwordRe) {
      $(".error-password").addClass("inactive");
    } else {
      $(".error-password").removeClass("inactive");
    }
  });
  //*ここまで

  //*idバリデーション
  $("#id").change(function () {
    var request = {
      data: $("#id").val(),
    };
    $.ajax({
      async: false,
      type: "GET",
      url: "Servlet",
      data: request,
      success: (truth) => {
        if (truth == "true") {
          $(".error-id").addClass("inactive");
        } else {
          $(".error-id").removeClass("inactive");
        }
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert(
          "リクエスト時になんらかのエラーが発生しました：" +
            textStatus +
            ":\n" +
            errorThrown
        );
      },
    });
  });
  //*ここまで
});
