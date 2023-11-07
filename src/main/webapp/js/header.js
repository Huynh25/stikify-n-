/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var header = document.querySelector(".header");

window.addEventListener("scroll", function() {
    if (window.pageYOffset > 0) {
        header.classList.add("fix-header"); // Thêm lớp "fixed-header"
    } else {
        header.classList.remove("fix-header"); // Loại bỏ lớp "fixed-header"
    }
});
