
// musicplayer.cpp
#include "musicplayer.h"

MusicPlayer::MusicPlayer(QObject *parent) : QObject(parent), player(new QMediaPlayer(this))
{
}

void MusicPlayer::play(const QString &url)
{
   // player->setMedia(QUrl::fromLocalFile(url));
    player->play();
}

void MusicPlayer::pause()
{
    player->pause();
}

void MusicPlayer::stop()
{
    player->stop();
}

void MusicPlayer::setVolume(int volume)
{
    //player->setVolume(volume);
}
