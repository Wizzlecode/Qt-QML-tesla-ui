// musicplayer.h
#ifndef MUSICPLAYER_H
#define MUSICPLAYER_H

#include <QObject>
#include <QMediaPlayer>

class MusicPlayer : public QObject
{
    Q_OBJECT
public:
    explicit MusicPlayer(QObject *parent = nullptr);

public slots:
    void play(const QString &url);
    void pause();
    void stop();
    void setVolume(int volume);

private:
    QMediaPlayer *player;
};

#endif // MUSICPLAYER_H
