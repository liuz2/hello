import axios from 'axios';

export function getUserInfo() {
    return axios.get('/user/info');
}

export function getBookList() {
    return axios.get('/book/list');
}

