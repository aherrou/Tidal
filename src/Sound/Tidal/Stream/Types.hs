module Sound.Tidal.Stream.Types where

import qualified Data.Map.Strict as Map
import Sound.Tidal.Pattern
import Sound.Tidal.Show ()

data PlayState = PlayState {pattern :: ControlPattern,
                            mute :: Bool,
                            solo :: Bool,
                            history :: [ControlPattern]
                           }
               deriving Show

type PatId = String
type PlayMap = Map.Map PatId PlayState

data TickState = TickState {
                    tickArc   :: Arc,
                    tickNudge :: Double
                   }
  deriving Show

patternTimeID :: String
patternTimeID = "_t_pattern"
