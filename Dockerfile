# Build environment for building Android Apps for the UDOO NEO

FROM jacekmarchwicki/android:ubuntu-16-04-java7-8

# Install Android Command Line Tools
# See https://developer.android.com/studio/index.html
RUN mkdir -p /opt/android-sdk-linux && \
    cd /opt/android-sdk-linux && \
    wget --output-document=tools_r25.2.5-linux.zip --quiet \
        https://dl.google.com/android/repository/tools_r25.2.5-linux.zip && \
    unzip -q tools_r25.2.5-linux.zip && \
    rm tools_r25.2.5-linux.zip

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Debug
RUN which android

# UDOO Neo
RUN android-accept-licenses.sh \
        "android update sdk --all --no-ui --filter platform-tools,build-tools-23.0.2,android-23,extra,sys-img"

## Most used SDKs
# RUN /opt/tools/android-accept-licenses.sh \
#         "/opt/android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-21.0.0,build-tools-21.0.1,build-tools-21.0.2,build-tools-21.1.0,build-tools-21.1.1,build-tools-21.1.2,build-tools-22.0.0,build-tools-22.0.1,build-tools-23.0.0,build-tools-23.0.3,build-tools-24.0.0,build-tools-24.0.1,build-tools-24.0.2,build-tools-24.0.3,build-tools-25.0.0,android-21,android-22,android-23,android-24,android-25,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-24"

# Debug
RUN which android
RUN which adb

## Create emulator
# RUN echo "no" | android create avd \
#                --force \
#                --device "UDOO Neo" \
#                --name my-udoo-neo \
#                --target android-23 \
#                --abi armeabi-v7a \
#                --skin WVGA800 \
#                --sdcard 512M

# Cleaning
RUN apt-get clean

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

# EOF
