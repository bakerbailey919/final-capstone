import axios from 'axios';

export default {
    getDevices() {
        return axios.get('/devices');
    },
    //getTopicID(id) {
    //    return http.get('/topics/' + id)
    //}
}