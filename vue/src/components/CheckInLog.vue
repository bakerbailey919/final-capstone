<template>
<div class="checkIns">
    <h2>Machine Log Check In Details</h2>
        <table id="table-checkins">
            <thead>
                <tr>
                    <th>&nbsp;</th>
                    <th>Audit Log Id</th>
                    <th>Property Name</th>
                    <th>Last Check In</th>
                    <th>Serial #</th>
                    <th>Name</th>
                    <th>Model ID</th>
                    <th>Arm Assist Left</th>
                    <th>Arm Assist Right</th>
                    <th>Arm Cart Left</th>
                    <th>Arm Cart Right</th>
                    <th>Pulley Data Left DistanceCCW</th>
                    <th>Pulley Data Left DistanceCW</th>
                    <th>Pulley Data Right DistanceCCW</th>
                    <th>Pulley Data Right DistanceCW</th>
                    <th>Battery Level</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="checkbox" id="insertFeatureHere" />
                    </td>
                    <td>
                        <input type="text" id="auditLogFilter" v-model="filter.auditLogId" />
                    </td>
                    <td>
                        <input type="text" id="propertyNameFilter" v-model="filter.propertyName" />
                    </td>
                    <td>
                        <input type="text" id="lastCheckInFilter" v-model="filter.lastCheckInTimeUtc" />
                    </td>
                    <td>
                        <input type="text" id="serialFilter" v-model="filter.serial" />
                    </td>
                    <td>
                        <input type="text" id="nameFilter" v-model="filter.name" />
                    </td>
                    <td>
                        <input type="text" id="modelIDFilter" v-model="filter.machineModelId" />
                    </td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td> Need a filter here?</td>
                    <td>
                        <input type="text" id="batteryLevelFilter" v-model="filter.batteryLevel" />
                    </td>
                </tr>
                <tr
                    v-for="checkIn in filteredList" v-bind:key="checkIn.auditLogId"
                >
                    <td>
                        <input type="checkbox" class="insertFeaturHere">
                    </td>
                    <td> {{ checkIn.auditLogId }} </td>
                    <td> {{ checkIn.propertyName }} </td>
                    <td> {{ checkIn.lastCheckInTimeUtc }} </td>
                    <td> {{ checkIn.serial }} </td>
                    <td> {{ checkIn.name }} </td>
                    <td> {{ checkIn.machineModelId }} </td>
                    <td> {{ checkIn.armAssistLeft }} </td>
                    <td> {{ checkIn.armAssistRight }} </td>
                    <td> {{ checkIn.armCartLeft }} </td>
                    <td> {{ checkIn.armCartRight }} </td>
                    <td> {{ checkIn.pulleyDataLeftDistanceCCW }} </td>
                    <td> {{ checkIn.pulleyDataLeftDistanceCW }} </td>
                    <td> {{ checkIn.pulleyDataRightDistanceCCW }} </td>
                    <td> {{ checkIn.pulleyDataRightDistanceCW }} </td>
                    <td> {{ checkIn.batteryLevel }} </td>
                </tr>
            </tbody>
        </table>    
</div>
  
</template>

<script>
import DeviceService from "../services/DeviceService.js";

export default 
{
    name: "machine-check-ins",
    props: {
        checkIn: Object
    },
    data() {
    return {
      checkIns: [],
      filter: {
        auditLogId: "",
        propertyName: "",
        lastCheckInTimeUtc: "",
        serial: "",
        name: "",
        machineModelId: "",
        batteryLevel: ""
      }
    };
  },
  created() {
      DeviceService.getMachineCheckIns()
      .then( (response) => {
          this.checkIns = response.data
      })
      .catch( (error) => {
          console.error(error);
      });
  },
computed:
    {
        filteredList() 
        {
            let filteredCheckIns = this.checkIns;
        

            if (this.filter.auditLogId != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                (chkin.auditLogId == this.filter.auditLogId)
                );
            }
            
            if (this.filter.propertyName != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                chkin.propertyName
                    .toLowerCase()
                    .includes(this.filter.propertyName.toLowerCase())
                );
            }
            if (this.filter.lastCheckInTimeUtc != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                chkin.lastCheckInTimeUtc
                    .toLowerCase()
                    .includes(this.filter.lastCheckInTimeUtc.toLowerCase())
                );
            }
            
            if (this.filter.serial != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                chkin.serial
                    .toLowerCase()
                    .includes(this.filter.serial.toLowerCase())
                );
            }
            if (this.filter.name != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                chkin.name
                    .toLowerCase()
                    .includes(this.filter.name.toLowerCase())
                );
            }
            if (this.filter.machineModelId != "") 
                
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                chkin.machineModelId
                    .toLowerCase()
                    .includes(this.filter.machineModelId.toLowerCase())
                );
            }

            if (this.filter.batteryLevel != "") 
            {
                filteredCheckIns = filteredCheckIns.filter((chkin) =>
                (chkin.batteryLevel <= this.filter.batteryLevel)
                ); 
            }
            
            return filteredCheckIns;
        }  
    }
}

</script>

<style>

</style>