Buzz.PlayerView = Ember.View.extend
  templateName: 'player'
  didInsertElement: () ->
    self = this
    player = this.$('audio')[0]


    # Resume playback from previous position
    player.addEventListener 'canplay', (event) ->
      currentTime = self.get('controller.current_episode.current_position')
      player.currentTime = currentTime


    # Set the current position in the current track
    player.addEventListener 'timeupdate', (event) ->
      self.get('controller').send('setCurrentPosition', this.currentTime)

    # Set the current tracks durration
    player.addEventListener 'durationchange', (event) ->
      self.get('controller').send('setDuration', this.duration)

    # play next track
    player.addEventListener 'ended', (event) ->
      self.get('controller').send('markPlayed')

  willDestroyElement: () ->
    player = this.$('audio')[0]
    player.removeEventListener 'ended'

