import axios from 'axios';

const http = axios.create({
    baseURL: 'http://localhost:3000'
});

export default {
    getDevices() {
        return http.get('/devices');
    },
    getTopicID(id) {
        return http.get('/topics/' + id)
    }
}