module Sound.Tidal.Params where

-- Please note, this file is generated by bin/generate-params.hs
-- Submit any pull requests against that file and/or params-header.hs
-- in the same folder, thanks.

{-
    Params.hs - Provides the basic control patterns available to TidalCycles by default
    Copyright (C) 2021, Alex McLean and contributors

    This library is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this library.  If not, see <http://www.gnu.org/licenses/>.
-}

import qualified Data.Map.Strict as Map

import Sound.Tidal.Pattern
import Sound.Tidal.Core ((#))
import Sound.Tidal.Utils
import Data.Maybe (fromMaybe)
import Data.Word (Word8)

-- | group multiple params into one
grp :: [String -> ValueMap] -> Pattern String -> ControlPattern
grp [] _ = empty
grp fs p = splitby <$> p
  where splitby name = Map.unions $ map (\(v, f) -> f v) $ zip (split name) fs
        split :: String -> [String]
        split = wordsBy (==':')

mF :: String -> String -> ValueMap
mF name v = fromMaybe Map.empty $ do f <- readMaybe v
                                     return $ Map.singleton name (VF f)

mI :: String -> String -> ValueMap
mI name v = fromMaybe Map.empty $ do i <- readMaybe v
                                     return $ Map.singleton name (VI i)

mS :: String -> String -> ValueMap
mS name v = Map.singleton name (VS v)

-- | Param makers

pF :: String -> Pattern Double -> ControlPattern
pF name = fmap (Map.singleton name . VF)

pI :: String -> Pattern Int -> ControlPattern
pI name = fmap (Map.singleton name . VI)

pB :: String -> Pattern Bool -> ControlPattern
pB name = fmap (Map.singleton name . VB)
 
pR :: String -> Pattern Rational -> ControlPattern
pR name = fmap (Map.singleton name . VR)

pN :: String -> Pattern Note -> ControlPattern
pN name = fmap (Map.singleton name . VN)

pS :: String -> Pattern String -> ControlPattern
pS name = fmap (Map.singleton name . VS)

pX :: String -> Pattern [Word8] -> ControlPattern
pX name = fmap (Map.singleton name . VX)

-- | Grouped params

sound :: Pattern String -> ControlPattern
sound = grp [mS "s", mF "n"]

cc :: Pattern String -> ControlPattern
cc = grp [mF "ccn", mF "ccv"]

nrpn :: Pattern String -> ControlPattern
nrpn = grp [mI "nrpn", mI "val"]

grain' :: Pattern String -> ControlPattern
grain' = grp [mF "begin", mF "end"]

midinote :: Pattern Note -> ControlPattern
midinote = note . (subtract 60 <$>)

drum :: Pattern String -> ControlPattern
drum = n . (subtract 60 . drumN <$>)

drumN :: Num a => String -> a
drumN "hq" = 27
drumN "sl" = 28
drumN "ps" = 29
drumN "pl" = 30
drumN "st" = 31
drumN "sq" = 32
drumN "ml" = 33
drumN "mb" = 34
drumN "ab" = 35
drumN "bd" = 36
drumN "rm" = 37
drumN "sn" = 38
drumN "cp" = 39
drumN "es" = 40
drumN "lf" = 41
drumN "ch" = 42
drumN "lt" = 43
drumN "hh" = 44
drumN "ft" = 45
drumN "oh" = 46
drumN "mt" = 47
drumN "hm" = 48
drumN "cr" = 49
drumN "ht" = 50
drumN "ri" = 51
drumN "cy" = 52
drumN "be" = 53
drumN "ta" = 54
drumN "sc" = 55
drumN "cb" = 56
drumN "cs" = 57
drumN "vi" = 58
drumN "rc" = 59
drumN "hb" = 60
drumN "lb" = 61
drumN "mh" = 62
drumN "hc" = 63
drumN "lc" = 64
drumN "he" = 65
drumN "le" = 66
drumN "ag" = 67
drumN "la" = 68
drumN "ca" = 69
drumN "ma" = 70
drumN "sw" = 71
drumN "lw" = 72
drumN "sg" = 73
drumN "lg" = 74
drumN "cl" = 75
drumN "hi" = 76
drumN "li" = 77
drumN "mc" = 78
drumN "oc" = 79
drumN "tr" = 80
drumN "ot" = 81
drumN "sh" = 82
drumN "jb" = 83
drumN "bt" = 84
drumN "ct" = 85
drumN "ms" = 86
drumN "os" = 87
drumN _ = 0

-- Generated params

