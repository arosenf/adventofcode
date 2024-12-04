(ns adventofcode.day03
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn extract-instruction-pairs [line]
  "Extracts integer pairs from the line that match the pattern mul(x,x)."
  (let [pattern #"mul\((\d+),(\d+)\)"]
    (->> (re-seq pattern line)
         (map (fn [[_ x y]] [(Integer. x) (Integer. y)])))))

(defn extract-enabled-instruction-pairs [line]
  "Extracts enabled integer pairs from the line that match the pattern mul(x,x)."
  (let [pattern #"do\(\)([\s\S]*?)mul\((\d+),(\d+)\)[\s\S]*?don't\(\)|mul\((\d+),(\d+)\)"]
    (->> (re-seq pattern line)
         (map (fn [[_ _ _ _ x y]] [(Integer. x) (Integer. y)])))))

(defn read-memory [file-path extraction-fn]
  "Reads the program memory."
  (with-open [rdr (io/reader (io/resource file-path))]
    (->> (line-seq rdr)
         (mapcat extraction-fn)
         (map (fn [[x y]] (* x y)))
         vec
         (reduce +))
    ))
