CheckAddProduct = () => {
    const form = document.getElementById('newBook');
    let bookId = form['bookId'];
    let name = form['name'];
    let price = form['unitPrice'];
    let stock = form['unitsInStock'];

    if (!check(/^B[0-9]{4,11}$/, bookId, "[상품 코드 \n B와 숫자를 조합하여 5 ~ 12 자까지 입력가능.(첫글자 반드시 B로 시작!)" )) {
        return false;
    }
    if (name.value.length < 4 || name.value.length >12) {
        alert('[상품명]\n최소 4 ~ 12 까지 입력 가능');
        name.select()
        name.focus();
        return false;
    }
    if (price.value.length === 0 || isNaN(price.value)) {
        alert('[가격]\n숫자만 입력가능')
        price.select();
        price.focus();
        return false;
    }
    if (price.value < 0) {
        alert('[가격]\n 음수는 입력 불가능!');
        price.select()
        price.focus();
        return false;
    }
    if (isNaN(stock.value)) {
        alert('[재고 수]\n숫자만 입력 가능!');
        stock.select();
        stock.focus();
        return false;
    }

    function check(regExp, e, msg) {
        if (regExp.test(e.value)) {
            return true;
        }
        alert(msg);
        e.select()
        e.focus();
        return false;
    }
    form.submit();
}