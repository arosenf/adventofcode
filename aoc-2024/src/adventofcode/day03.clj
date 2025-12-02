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

(defn extract-muls [text]
  "Extracts mul(x,x) expressions that are either at the start of the string or preceded by do() with no don't() before it."
  (loop [chars (seq text)
         inside-do? false
         inside-dont? false
         result []
         buffer ""]
    (cond
      ;; If we've processed all characters, return the result.
      (nil? chars) result

      ;; If we encounter 'do()', enable inside-do? flag.
      (and (not inside-dont?) (= (take 4 chars) (seq "do()")))
      (recur (drop 4 chars) true inside-dont? result buffer)

      ;; If we encounter 'don't()', set inside-dont? flag.
      (and (not inside-do?) (= (take 6 chars) (seq "don't()")))
      (recur (drop 6 chars) inside-do? true result buffer)

      ;; If we encounter 'mul(', process the 'mul' expression.
      (and (not inside-dont?) (str/starts-with? (apply str (take 4 chars)) "mul("))
      (let [mul-end (str/index-of (apply str chars) ")")]
        (if mul-end
          (let [mul-expr (subs (apply str chars) 0 (+ mul-end 1))]
            (recur (drop (+ mul-end 1) chars)
                   inside-do?
                   inside-dont?
                   (conj result mul-expr)  ;; Add the found mul(x,x) to result
                   ""))
          (recur (rest chars) inside-do? inside-dont? result buffer)))

      ;; Otherwise, continue iterating through characters.
      :else (recur (rest chars) inside-do? inside-dont? result buffer))))

(defn read-memory [file-path extraction-fn]
  "Reads the program memory."
  (with-open [rdr (io/reader (io/resource file-path))]
    (->> (line-seq rdr)
         (mapcat extraction-fn)
         (map (fn [[x y]] (* x y)))
         vec
         (reduce +))
    ))
