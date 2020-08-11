<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>カレンダー</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/regist.css" />
    <link
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./src/script.js"></script>
  </head>
  <body>
    <header>
      <h1 class="title">カレンダー</h1>
    </header>
    <main>
      <form action="../Servlet" method="GET">
        <input type="hidden" name="page" value="reRegist">
        <section class="form-login-container">
          <p class="form-title">ログインID</p>
          <input id="id" class="form-input" type="text" name="id" readonly value="<%= id %>"/>
        </section>
        <section class="form-term-container">
          <p class="term-title">前学期</p>
          <div class="form-period-container">
            <div class="period">
              <p>開始日</p>
              <div class="form-parts">
                <select
                  required
                  class="form-input"
                  name="previousterm-start-month"
                >
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
                月
                <select
                  required
                  class="form-input"
                  name="previousterm-start-day"
                >
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                日
              </div>
            </div>
            <div class="period">
              <p>終了日</p>
              <div class="form-parts">
                <select
                  required
                  class="form-input"
                  name="previousterm-end-month"
                >
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
                月
                <select required class="form-input" name="previousterm-end-day">
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                日
              </div>
            </div>
          </div>
          <div class="form-lesson-container">
            <div class="lesson-title-button">
              <p>履修登録</p>
              <button type="button" class="btn back deletion">削除する</button>
              <button type="button" class="btn go addition">追加する</button>
            </div>
            <div class="lesson">
              <div class="lesson-subtitle">
                <p class="lesson-subtitle-short">曜日</p>
                <p class="lesson-subtitle-short">時限</p>
                <p class="lesson-subtitle-long">教科名</p>
              </div>
              <div class="form-parts-container">
                <div class="form-parts">
                  <select
                    required
                    class="form-input"
                    name="previousterm-lesson-weekday"
                  >
                    <option value="">選択</option>
                    <option value="月">月</option>
                    <option value="火">火</option>
                    <option value="水">水</option>
                    <option value="木">木</option>
                    <option value="金">金</option>
                    <option value="土">土</option>
                    <option value="日">日</option>
                  </select>
                </div>
                <div class="form-parts">
                  <select
                    required
                    class="form-input"
                    name="previousterm-lesson-time"
                  >
                    <option value="">選択</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                  </select>
                </div>
                <div class="form-parts">
                  <input
                    class="form-input"
                    name="previousterm-lesson-subjects"
                    type="text"
                    required
                  />
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="form-term-container">
          <p class="term-title">後学期</p>
          <div class="form-period-container">
            <div class="period">
              <p>開始日</p>
              <div class="form-parts">
                <select
                  required
                  class="form-input"
                  name="afterterm-start-month"
                >
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
                月
                <select required class="form-input" name="afterterm-start-day">
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                日
              </div>
            </div>
            <div class="period">
              <p>終了日</p>
              <div class="form-parts">
                <select required class="form-input" name="afterterm-end-month">
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
                月
                <select required class="form-input" name="afterterm-end-day">
                  <option value="">選択</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                日
              </div>
            </div>
          </div>
          <div class="form-lesson-container">
            <div class="lesson-title-button">
              <p>履修登録</p>
              <button type="button" class="btn back deletion">削除する</button>
              <button type="button" class="btn go addition">追加する</button>
            </div>
            <div class="lesson">
              <div class="lesson-subtitle">
                <p class="lesson-subtitle-short">曜日</p>
                <p class="lesson-subtitle-short">時限</p>
                <p class="lesson-subtitle-long">教科名</p>
              </div>
              <div class="form-parts-container">
                <div class="form-parts">
                  <select
                    required
                    class="form-input"
                    name="afterterm-lesson-weekday"
                  >
                    <option value="">選択</option>
                    <option value="月">月</option>
                    <option value="火">火</option>
                    <option value="水">水</option>
                    <option value="木">木</option>
                    <option value="金">金</option>
                    <option value="土">土</option>
                    <option value="日">日</option>
                  </select>
                </div>
                <div class="form-parts">
                  <select
                    required
                    class="form-input"
                    name="afterterm-lesson-time"
                  >
                    <option value="">選択</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                  </select>
                </div>
                <div class="form-parts">
                  <input
                    class="form-input"
                    name="afterterm-lesson-subjects"
                    type="text"
                    required
                  />
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="form-btn-container">
          <a class="btn back" href="./index.html">キャンセル</a>
          <input class="btn go" type="submit" value="登録" />
        </section>
      </form>
    </main>
  </body>
</html>
