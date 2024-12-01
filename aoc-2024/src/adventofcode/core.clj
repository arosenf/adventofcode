(ns adventofcode.core
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn read-columns [file-path]
  "Reads a file with two numeric columns and returns a map with two vectors: :col1 and :col2."
  (with-open [rdr (io/reader (io/resource file-path))]
    (let [lines (line-seq rdr)
          data  (map #(mapv (fn [location] (Integer/parseInt location)) (str/split % #"\s+")) lines)
          locations1  (mapv first data)
          locations2  (mapv second data)]
      {:locations1 locations1 :locations2 locations2})))

(defn sort-locations [columns]
  "Takes a map of columns (from read-columns) and returns a map with sorted :col1 and :col2."
  (-> columns
      (update :locations1 sort)
      (update :locations2 sort)))

(defn sum-absolute-differences [columns]
  "Calculates the sum of the absolute differences between corresponding entries in ::locations1 and ::locations2."
  (let [loc1 (:locations1 columns)
        loc2 (:locations2 columns)
        differences (map #(Math/abs (- %1 %2)) loc1 loc2)]
    (reduce + differences)))

(defn solve [file-path]
  "Reads a file and returns a map with sorted :locations1 and :locations2."
  (-> file-path
      read-columns
      sort-locations
      sum-absolute-differences))

;REPL command
;(require 'adventofcode.core :reload)
;(def sorted-data (solve "day01/example.txt"))
;(println sorted-data)
