import QtQuick
import QtLocation
import QtQuick.Controls
import QtPositioning
import QtMultimedia



Window {
    visible: true
    title: "Projet_SAE"
    width: 1280
    height: 720
    //flags: Qt.Window | Qt.FramelessWindowHint // Set window flags for borderless

    // Set a fixed size
    minimumWidth: 1280
    maximumWidth: 1280
    minimumHeight: 720
    maximumHeight: 720

property var hvacControllerdriver: driverHVAC
property var hvacControllerpassenger: passengerHVAC
property int onBatteryLevelChanged: batteryLevel
FontLoader { id: montserrat; source: "qrc:/assets/Montserrat-Medium.ttf" }



    Rectangle{


        id:bottombar
        anchors{
            left:parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color:"black"
        height: parent.height /12

        Image {
        id: car_ico
            anchors{
                left:parent.left
                leftMargin: 30
                verticalCenter: parent.verticalCenter

            }
        height: parent.height*0.85
        fillMode: Image.PreserveAspectFit
        source : "qrc:/assets/car_ico.jpg"
        }

        Image {
        id: fan
            anchors{
                left:parent.left
                leftMargin: 640
                top: parent.top
                topMargin: 4

            }
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source : "qrc:/assets/fan.png"
        }
        Image {
        id: music_ico
            anchors{
                left:parent.left
                leftMargin: 430
                top: parent.top
                topMargin: 1

            }
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source : "qrc:/assets/music.png"
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setMusicDisplay(!systemHandler.musicDisplay)
        }
        }


        Image {
        id: leftseat
            anchors{
                left:parent.left
                leftMargin: 180
                verticalCenter: parent.verticalCenter

            }
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source : "qrc:/assets/left_seat.png"
        }

        Image {
        id: rightseat
            anchors{
                left:parent.left
                leftMargin: 1050
                verticalCenter: parent.verticalCenter

            }
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source : "qrc:/assets/right_seat.png"
        }




        Rectangle{
            // Identificateur unique pour cette instance Rectangle
            id: driverHVACControl

            // Positionnement par rapport aux autres éléments
            anchors {
                left: car_ico.right
                top: parent.top
                bottom: parent.bottom
                leftMargin: 150
            }

            // Définition de la largeur en fonction de la hauteur
            width: height / 2;

            // Couleur du rectangle
            color: "black"

            // Texte de décrément
            Text {
                id: decrementText
                color: "#f0eded"
                anchors.centerIn: parent
                text: "-"
                font.pixelSize: 20
            }

            // Zone cliquable
            MouseArea {
                anchors.fill: parent
                // Action à effectuer lors du clic
                onClicked: hvacControllerdriver.incrementTargetTemperature(-1)
            }

            // Texte de la température cible
            Text {
                id: targetTemperatureText
                anchors {
                    left: driverHVACControl.right
                    leftMargin: 15
                    verticalCenter: parent.verticalCenter
                }
                color: "#f0eded"
                font.pixelSize: 24
                // Affichage de la température cible
                text: driverHVAC.targetTemperature + "°C"
            }

            // Bouton d'incrémentation
            Rectangle {
                id: incrementButton
                anchors {
                    left: targetTemperatureText.right
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin: 15
                }
                width: height / 2;
                color: "black"

                // Texte d'incrément
                Text {
                    id: incrementText
                    color: "#f0eded"
                    anchors.centerIn: parent
                    text: "+"
                    font.pixelSize: 20
                }

                // Zone cliquable
                MouseArea {
                    anchors.fill: parent
                    // Action à effectuer lors du clic
                    onClicked: hvacControllerdriver.incrementTargetTemperature(1)
                }
            }
        }

        Rectangle{

            id:passengerHVACControl
            anchors{
                right:parent.right
                top: parent.top
                bottom: parent.bottom
                rightMargin : 150
            }

            width: height/2;
            color: "black"
            Text {
                id: decrementTextpassenger
                color: "#f0eded"
                anchors.centerIn: parent
                text: "-"
                font.pixelSize: 20
            }
            MouseArea{
                anchors.fill:parent
                onClicked: hvacControllerpassenger.incrementTargetTemperature(-1)
            }
            Text {
                id: targetTemperatureTextpassenger
                anchors{
                    left: passengerHVACControl.right
                    leftMargin: 15
                    verticalCenter: parent.verticalCenter

                }
                color: "#f0eded"
                font.pixelSize: 24
                text: passengerHVAC.targetTemperature +"°C"
                }
            Rectangle{
                id:incrementButtonpassenger
                anchors{
                    left:targetTemperatureTextpassenger.right
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin : 15
                }
                width: height/2;
                color: "black"
                Text {
                    id: incrementTextpassenger
                    color: "#f0eded"
                    anchors.centerIn: parent
                    text: "+"
                    font.pixelSize: 20
                }
                MouseArea{
                    anchors.fill:parent
                    onClicked: hvacControllerpassenger.incrementTargetTemperature(1)
                }

          }

        }
        Image {
            id: windshield
            anchors{
                left:parent.left
                leftMargin: 750
                top: parent.top
                topMargin: 15

            }

            fillMode: Image.PreserveAspectFit
            source:(systemHandler.windshield ? "qrc:/assets/windshield_true.png" : "qrc:/assets/windshield_false.png" )
            MouseArea{
                anchors.fill:parent
                onClicked:  systemHandler.setWindshield(!systemHandler.windshield)
            }
        }
        Image {
            id: heat
            anchors{
                left:parent.left
                leftMargin: 820
                top: parent.top
                topMargin: 15

            }

            fillMode: Image.PreserveAspectFit
            source:(systemHandler.heat ? "qrc:/assets/heat_true.png" : "qrc:/assets/heat_false.png" )
            MouseArea{
                anchors.fill:parent
                onClicked:  systemHandler.setHeat(!systemHandler.heat)
            }
        }

    }



    Rectangle{

        id:rightscreen
        anchors{
            top: parent.top
            bottom: bottombar.top
            right: parent.right
        }


        Map {
            anchors.fill: parent

            // Map item properties
            center: QtPositioning.coordinate(49.459359, 1.068750)
            zoomLevel: 12

            // Plugin configuration
            plugin: Plugin {
                id: mapPlugin
                name: "osm"
            }
        }



        Image {
            id: cadenas
            anchors{
                left: parent.left
                top: parent.top
                margins: 20
            }
            width: parent.width /40
            fillMode: Image.PreserveAspectFit
            source:(systemHandler.carLocked ? "qrc:/assets/cadenas_f.png" : "qrc:/assets/candenas_o.png" )
            MouseArea{
                anchors.fill:parent
                onClicked:  systemHandler.setCarLocked(!systemHandler.carLocked)
            }
        }

        Text {
            id: dateTimeDisplay
            anchors{
                left: cadenas.right
                leftMargin: 40
                bottom: cadenas.bottom
            }
            font.pixelSize: 12
            font.bold:true
            color: "black"
            text: systemHandler.currentTime
        }
        Text {
            id: outdoorTemperatureDisplay
            anchors{
                left: dateTimeDisplay.right
                leftMargin: 40
                bottom: cadenas.bottom
            }
            font.pixelSize: 12
            font.bold:true
            color: "black"
            text: systemHandler.outdoorTemp+"°C"
        }
        Text {
            id: userNameDisplay
            anchors{
                left: outdoorTemperatureDisplay.right
                leftMargin: 40
                bottom: cadenas.bottom
            }
            font.pixelSize: 12
            font.bold:true
            color: "black"
            text: systemHandler.userName
        }
        Rectangle {
            id:music
            visible: systemHandler.musicDisplay //pour bouton clickable
            width: 400
            height: 200
            color: "#EFEFEF"
            radius: 10

            anchors {
                top: parent.top
                topMargin: 450
                left: parent.left
                leftMargin: 10
            }

            Image {
                source: "qrc:/assets/mbdtf.jpg"
                fillMode: Image.PreserveAspectFit
                width: parent.width *0.7
                height: parent.height*0.7
                anchors{
                    top: music.top
                    topMargin: 5
                    left: music.left
                    leftMargin: 65
                }
            }

            MediaPlayer {
                id: player
                source: "qrc:/assets/Kanye_West_POWER.mp3"
                audioOutput: AudioOutput {}
            }



            Button {
                text: "Play"
                onClicked: player.play()
                background: Rectangle {
                             color: button.down ? "#d6d6d6" : "#f6f6f6"
                             border.color: "#26282a"
                             border.width: 1
                             radius: 4
                         }
                anchors {
                    top: music.top
                    topMargin: 160
                    left: music.left
                    leftMargin: 90
                }

            }

            Button {
                text: "Pause"
                onClicked: player.pause()
                background: Rectangle {
                             color: button.down ? "#d6d6d6" : "#f6f6f6"
                             border.color: "#26282a"
                             border.width: 1
                             radius: 4
                         }
                anchors {
                    top: music.top
                    topMargin: 160
                    left: music.left
                    leftMargin: 180
                }
            }

            Button {
                text: "Stop"
                onClicked: player.stop()
                background: Rectangle {
                             color: button.down ? "#d6d6d6" : "#f6f6f6"
                             border.color: "#26282a"
                             border.width: 1
                             radius: 4
                         }
                anchors {
                    top: music.top
                    topMargin: 160
                    left: music.left
                    leftMargin: 280
                }

            }


        }




    width:  parent.width * 2/3
    }

    Rectangle {
        id: leftscreen
        anchors {
            left: parent.left
            right: rightscreen.left
            bottom: bottombar.top
            top: parent.top
        }




        Image {
            id: carRender
            anchors {
                left: parent.left
                leftMargin: 80
                top: parent.top
                topMargin: 90
            }
            height: parent.height
            fillMode: Image.PreserveAspectFit
            source: "qrc:/assets/car.png"
        }

        color: "#EFEFEF"

        Text {
            id: numberLabel
            anchors{
                top:parent.top
                topMargin: 40
                left: parent.left
                leftMargin: 160
                verticalCenter: parent.verticalCenter

            }
            text: systemHandler.speed  // Replace with your variable number
            font.pixelSize: 80
            color: "black"
        }
        Text {
            id: kmh
            anchors{
                top:parent.top
                topMargin: 145//à modifier
                left: parent.left
                leftMargin: 190
                verticalCenter: parent.verticalCenter

            }
            text: "KMH"
            font.pixelSize: 18
            color: "#A9A9A9"
        }
        Image {
            anchors{
                top:parent.top
                topMargin: 139//à modifier
                left: parent.left
                leftMargin: 344
            }
            id: battery_image
            fillMode: Image.PreserveAspectFit
            source: "qrc:/assets/battery.png"
        }

        Rectangle {
            id: battery
            anchors {
                top: parent.top
                topMargin: 145
                left: parent.left
                leftMargin: 350
            }
            height: 18
            color: "#25CB55"

            Binding {
                target: battery
                property: "width"
                value: systemHandler.batteryLevel*0.6
            }
        }

        Text {
            id: battery_display
            anchors{
                top:parent.top
                topMargin: 145
                left: parent.left
                leftMargin: 300

            }
            text: systemHandler.batteryLevel + "%"
            font.pixelSize: 18
            color: "#A9A9A9"
        }

        Rectangle {
            id: delimitation
            anchors {
                top: parent.top
                topMargin: 180
                left: parent.left
                leftMargin: 15
            }
            height: 2
            width: 400
            color: "#A9A9A9"
        }
        Text {
            id: speed_limiter_label
            color: "#A9A9A9"
            anchors {
                top: parent.top
                topMargin: 188
                left: parent.left
                leftMargin: 170
            }
            text: "speed limiter"
            font.pixelSize: 14
        }
        Rectangle {
            id: speedLimiterControl
            anchors {
                top: parent.top
                topMargin: 205
                left: parent.left
                leftMargin: 138
            }
            width: 40  // Set an explicit width value
            height: 40  // Set an explicit height value
            color: "#EFEFEF"

            Text {
                id: decrement_speed
                color: "#A9A9A9"
                anchors.centerIn: parent
                text: "-"
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                onClicked: speedLimiter.adjustSpeedLimit(-10)
            }

            Text {
                id: speedLimitText
                anchors {
                    left: speedLimiterControl.right
                    leftMargin: 15
                    verticalCenter: parent.verticalCenter
                }
                color: "#A9A9A9"
                font.pixelSize: 24
                text: speedLimiter.speedLimit
            }

            Rectangle {
                id: increment_speed
                anchors {
                    left: speedLimitText.right
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin: 15
                }
                width: 40  // Set an explicit width value
                height: 40  // Set an explicit height value
                color: "#EFEFEF"

                Text {
                    id: increment_Text
                    color: "#A9A9A9"
                    anchors.centerIn: parent
                    text: "+"
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: speedLimiter.adjustSpeedLimit(10)
                }
            }
        }
        Image {
            id: gears
                anchors {
                    left: parent.left
                    top: parent.top
                    topMargin: 145
                    leftMargin: 15
                }
            fillMode: Image.PreserveAspectFit
            source: "qrc:/assets/gear.png"
        }




        // Your QML code
        Rectangle {
            width: 45
            height: 35
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 200
                leftMargin: 350
            }

            // Clickable area
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Toggle the state of the indicator on click
                    rightIndicatorManager.indicatorState=!rightIndicatorManager.indicatorState;
                }
            }

            // Right indicator image
            Image {
                source: rightIndicatorManager.indicatorState ? "qrc:/assets/right_full.png" : "qrc:/assets/right_empty.png"
                height: parent.height
                width: parent.width
            }
        }

        // Your QML code
        Rectangle {
            width: 45
            height: 35
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 200
                leftMargin: 20
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Toggle the state of the indicator on click
                    leftIndicatorManager.indicatorState=!leftIndicatorManager.indicatorState;
                }
            }

            Image {
                id: leftIndicatorImage
                height: parent.height
                width: parent.width

                // Update the source based on the indicator state
                source: leftIndicatorManager.indicatorState ? "qrc:/assets/left_full.png" : "qrc:/assets/left_empty.png"
            }
        }

        Image {
            id: handbrake
            anchors{
                left:parent.left
                leftMargin: 360
                top: parent.top
                topMargin: 620

            }

            fillMode: Image.PreserveAspectFit
            source:(systemHandler.handbrake ? "qrc:/assets/handbrake_true.png" : "qrc:/assets/handbrake_false.png" )
            MouseArea{
                anchors.fill:parent
                onClicked:  systemHandler.setHandbrake(!systemHandler.handbrake)
            }
        }
        Image {
            id: light
            anchors{
                left:parent.left
                leftMargin: 300
                top: parent.top
                topMargin: 620

            }

            fillMode: Image.PreserveAspectFit
            source:(systemHandler.light ? "qrc:/assets/light_true.png" : "qrc:/assets/light_false.png" )
            MouseArea{
                anchors.fill:parent
                onClicked:  systemHandler.setLight(!systemHandler.light)
            }
        }















       /* Text {                     //reglage boite vitesse à reparer
            id: clickableText

            property string originalText: "" // Store the original text
            property bool isUpperCase: true // Store the case state

            anchors.fill: parent
            font.pixelSize: 20
            color: isUpperCase ? "grey" : "darkgrey"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    isUpperCase = !isUpperCase; // Toggle the case
                    clickableText.text = isUpperCase ? originalText.toUpperCase() : originalText.toLowerCase();
                    clickableText.color = isUpperCase ? "grey" : "darkgrey";
                }
            }
        }
        Rectangle {
            id: gears
            Text {
                id: text
                anchors {
                    left: parent.left
                    top: parent.top
                    topMargin: 145
                    leftMargin: 15
                }
                text: "P"
                font.pixelSize: 18
                color: "grey"

                // The mouse area to handle clicks
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        color: isUpperCase

                    }
                }
            }
        }
*/







    }



}
