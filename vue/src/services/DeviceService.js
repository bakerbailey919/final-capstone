import axios from 'axios';

export default {
    getDevices() {
        return axios.get('/devices');
    },
    getMachineCheckIns() {
        return axios.get('/machine');
    },
    getAlerts(){
        return axios.get('/alerts')
    }
    //getTopicID(id) {
    //    return http.get('/topics/' + id)
    //}
}