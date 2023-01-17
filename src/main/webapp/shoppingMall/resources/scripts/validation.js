const form = window.document.getElementById('form');

CheckAddProduct = () => {
    let id = form['productId'];
    let name = form['pname'];
    let price = form['unitPrice'];
    let stock = form['unitsInStock'];

    if (!check(/^P[0-9]{4,11}$/, id, "<<상품 코드>>\n P와 숫자를 조합하여 5 ~ 12 자 까지 입력하세요. \n 첫 글자는 반드시  P로 시작하셍요.")) {
        return false;
    }

    if (name.value.length < 4 || name.value.length > 12) {
        alert('상품 명 최소 4 ~ 12 까지 입니다.')
        name.select();
        name.focus();
        return false;
    }

    if (price.value.length === 0 || isNaN(price.value)) {
        alert("숫자 정수만 입력 가능합니다.")
        price.select();
        price.focus();
        return false;
    }

    if (price.value < 0) {
        alert("음수는 입력 불가능 합니다.")
        price.select();
        price.focus();
        return false;
    }

    if (isNaN(stock.value)) {
        alert('재고 수랼은 정수/숫자만 입력 가능합니다.');
        stock.select();
        stock.focus();
        return false;
    }

    function check (regExp, param, message) {
        if (regExp.test(param.value)) {
            return true;
        }

        alert(message);
        param.select();
        param.focus();
        return false;
    }
    form.submit();
}