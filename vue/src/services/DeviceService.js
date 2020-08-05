import axios from 'axios';

export default {
    getDevices() {
        return axios.get('/devices');
    },
    getMachineCheckIns() {
        return axios.get('/machine');
    }
    //getTopicID(id) {
    //    return http.get('/topics/' + id)
    //}
}