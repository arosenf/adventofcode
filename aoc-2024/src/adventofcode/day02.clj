(ns adventofcode.day02
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn read-reports [file-path]
  "Reads a report file."
  (with-open [rdr (io/reader (io/resource file-path))]
    (let [lines (line-seq rdr)
          data (mapv #(mapv (fn [level] (Integer/parseInt level)) (str/split % #"\s+")) lines)]
      data)))

(defn safe-report [report]
  "Predicate that checks if a report is valid"
  (and
    (or (apply < report) (apply > report))
    (every? #(> 4 (Math/abs (- (first %) (second %)))) (partition 2 1 report))
    ))

(defn safe-report-dampened [report]
  "Predicate that checks if a dampened report is valid"
  (not (empty? (filter safe-report
          (map-indexed (fn [idx _] (vec (concat (take idx report) (drop (inc idx) report)))) report)
          ))))

(defn safe-reports [reports safety-fn]
  "Filters the report lines for valid reports according to the rules."
  (count (filter safety-fn reports)))

(defn solve-02-1 [file-path]
  "Solves day02 part 1."
  (let [reports (read-reports file-path)]
    (safe-reports reports safe-report)))

;REPL command
;(require 'adventofcode.day02 :reload)
;(def solution (solve-02-1 "day02/input.txt"))
;(println solution)

(defn solve-02-2 [file-path]
  "Solves day02 part 2."
  (let [reports (read-reports file-path)]
    (safe-reports reports safe-report-dampened)))

;REPL command
;(require 'adventofcode.day02 :reload)
;(def solution (solve-02-2 "day02/input.txt"))
;(println solution)
