(ns adventofcode.core-test
  (:require [clojure.test :refer :all]
            [adventofcode.core :refer :all]))

(deftest day01-1-test
  (testing "Test day01-1."
    ;; Prepare test data
    (let [file-path "resources/day01/example.txt"]

      ;; Test
      (is (= 11 (solve-01-1 "day01/example.txt"))))))

(deftest day01-2-test
  (testing "Test day01-2."
    ;; Prepare test data
    (let [file-path "resources/day01/example.txt"]

      ;; Test
      (is (= 31 (solve-01-2 "day01/example.txt"))))))
