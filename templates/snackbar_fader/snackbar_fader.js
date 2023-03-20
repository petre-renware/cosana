/*
    Fading messages in JS
    (c) 2023 RENware Software Systems

    - javascript snackbar flashing component
*/




function snackbar(type, msg, time) {
    const snackbarContainer = document.getElementById('snackbar-container');
    const para = document.createElement('P');
    para.classList.add('snackbar');
    para.innerHTML = msg + '<span> &times </span>';
    if(type === 'error') {
        para.classList.add('error');
    }
    else if(type === 'success') {
        para.classList.add('success');
    }
    else if(type === 'warning') {
        para.classList.add('warning');
    }
    else if(type === 'info') {
        para.classList.add('info');
    }

    snackbarContainer.appendChild(para);
    para.classList.add('fade-out');

    setTimeout(()=>{
        snackbarContainer.removeChild(para)
    }, time);
}
